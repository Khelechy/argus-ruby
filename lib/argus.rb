
class Argus 
  def initialize(username = "", password = "", host = "", port = 0)
    @username = username
    @password = password
    @host = host.empty? ? "127.0.0.1" : host
    @port = port == 0 ? 1337 : port
  end

  def connect
    puts "Staring argus client with #{@username} #{@password} #{@host} #{@port}"
  end

  def send_auth_data
    connectionString = "<ArgusAuth>#{@username}:#{@password}</ArgusAuth>"
  end
end

argus = Argus.new("testusername", "tespassword")
argus.connect