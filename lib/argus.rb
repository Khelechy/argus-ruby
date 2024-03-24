
require 'socket'
require 'json'
require 'ostruct'

require_relative 'helpers/helpers'
require_relative 'handlers/eventbus'

class Argus 

  def initialize(username = "", password = "", host = "", port = 0)
    @username = username
    @password = password
    @host = host.empty? ? "127.0.0.1" : host
    @port = port == 0 ? 1337 : port

    @socket = nil

    @event_bus = EventBus.new
  end

  def connect

    @socket = TCPSocket.open(@host, @port)

    send_auth_data()

    loop do
      data = @socket.readpartial(1024)

      if !data.nil? && !data.empty?

        if Helpers.is_json_string(data)
          publish_argus_data(data)
        else
          puts "Received: #{data}"
        end

      end
    end

  rescue EOFError
    puts "Connection closed by server"

  rescue StandardError => e
    puts "Error receiving data: #{e.message}"

  puts "Socket closed"
  @socket.close
  end

  def subscribe(subscriber, method_name)
    @event_bus.subscribe(subscriber, method_name)
  end

  private

  def publish_argus_data(data)
    argus_event = JSON.parse(data, object_class: OpenStruct)
    @event_bus.publish(argus_event)
  end


  def send_auth_data()
    connectionString = "<ArgusAuth>#{@username}:#{@password}</ArgusAuth>"
    @socket.puts(connectionString)
  end
end