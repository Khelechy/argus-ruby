
require 'socket'
require_relative 'Helpers/helpers'

class Argus 

  def initialize(username = "", password = "", host = "", port = 0)
    @username = username
    @password = password
    @host = host.empty? ? "127.0.0.1" : host
    @port = port == 0 ? 1337 : port

    @socket = nil
  end

  def connect

    @socket = TCPSocket.open(@host, @port)

    send_auth_data()

    loop do
      data = @socket.readpartial(1024)

      if !data.nil? && !data.empty?

        if Helpers.is_json_string(data)
          puts data
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

  private

  def send_auth_data()
    connectionString = "<ArgusAuth>#{@username}:#{@password}</ArgusAuth>"
    @socket.puts(connectionString)
  end
end

argus = Argus.new("testuser", "testpassword")
argus.connect