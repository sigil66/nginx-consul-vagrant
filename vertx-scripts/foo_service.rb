# Quick example foo service
# The pattern here is to register/deregister the consul agent when I come and go
# A production service would also register it's health endpoint and would not be
# written in ruby. It might choose to do something meaningful as well.

require 'json'

SERVICE_PORT = 8888

@consul_client = $vertx.create_http_client({
  'defaultHost' => 'localhost',
  'defaultPort' => 8500
})

# On start register with Consul
def vertx_start
  @consul_client.request(:PUT, "/v1/agent/service/register") { |response|
    if response.status_code() == 200
      puts "Registered foo service with Consul"
    else 
      puts "Failed to register foo service with Consul"
    end
  }.end({
    "ID" => "foo_service",
    "Name" => "foo",
    "Tags" => [
      "service"
    ],
    "Port" => SERVICE_PORT
  }.to_json)
end

# On stop de-register from Consul
def vertx_stop_async stop_future
  @consul_client.request(:GET, "/v1/agent/service/deregister/foo_service") { |response|
    if response.status_code() == 200
      puts "Deregistered foo service from Consul"
      stop_future.complete
    else 
      puts "Failed to deregister foo service with Consul"
      stop_future.complete
    end
  }.end()
end

$vertx.create_http_server().request_handler() { |req|
  req.response()
    .put_header("content-type", "text/html")
    .end("<html><body><h1>I am FOO SERVICE</h1></body></html>")
}.listen(SERVICE_PORT)
