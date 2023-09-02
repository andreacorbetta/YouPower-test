require 'bunny'

# connect to RabbitMQ server

connection = Bunny.new()
connection.start

# channel creation

channel = connection.create_channel

# queue declaration

queue = channel.queue('hello')

# deliver message asyncronously from queue

begin
  puts ' [*] Waiting for messages. To exit press CTRL+C'
  queue.subscribe(block: true) do |_delivery_info, _properties, body|
    puts " [x] Received #{body}"
  end

# close connection

rescue Interrupt => _
  connection.close

  exit(0)
end