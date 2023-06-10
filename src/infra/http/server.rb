require 'webrick'
require 'json'
require_relative './modules/user/user-controller'

class MyServer < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    if request.path == '/users'
    end
  end

  def do_POST(request, response)
    if request.path == '/users'
      UserController.new().create(request, response)
    end
  end
end

server = WEBrick::HTTPServer.new(:Port => 8000)
server.mount '/', MyServer

trap('INT') { server.shutdown }
server.start

