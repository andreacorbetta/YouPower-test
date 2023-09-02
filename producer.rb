require 'bunny'

# connect to RabbitMQ server

connection = Bunny.new
connection.start

# channel creation

channel = connection.create_channel

# queue declaration

queue = channel.queue('hello')

channel.default_exchange.publish('Hello World!', routing_key: queue.name)

# close connection

connection.close