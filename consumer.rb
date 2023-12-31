require 'bunny'

# connect to RabbitMQ server

begin 

  connection = Bunny.new(host:  'localhost',
                         port:  '4369',
                         vhost: '/',
                         user:  'guest',
                         pass:  'guest')                    
  connection.start

rescue Bunny::TCPConnectionFailed

  puts "Connection to #{connection.host} failed"

rescue Bunny::PossibleAuthenticationFailureError

  puts "Could not authenticate as #{connection.user}"

end

# channel creation

channel = connection.create_channel

# queue declaration

queue = channel.queue('hello', durable: true)

# deliver message asyncronously from queue

begin
  puts ' [*] Waiting for messages. To exit press CTRL+C'
  queue.subscribe(manual_ack: true, block: true) do |_delivery_info, _properties, body|
    
    puts " [x] Received #{body}"
    
    channel.ack(delivery_info.delivery_tag)
  end

# close connection

rescue Interrupt => _
  connection.close

  exit(0)
end