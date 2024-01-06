require "socket"
server = TCPServer.new("localhost", 8101)
loop do
  client = server.accept
  path "." + client.gets.split(" ")[1]
  while header = client.gets
    break if header.chomp.empty?
  end

  if File.file? path
    client.puts "HTTP/1.1 200 OK"
    client.puts "Content-Type: text/plain"
    client.puts
    client.puts "HTTP/1.0 404 Not Found"
  end

  client.close
end
