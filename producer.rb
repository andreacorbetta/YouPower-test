require 'bunny'

# connect to RabbitMQ server

connection = Bunny.new(host:  'localhost',
                       port:  '4369',
                       vhost: '/',
                       user:  'guest',
                       pass:  'guest')
connection.start

# channel creation

channel = connection.create_channel

# queue declaration

queue = channel.queue('hello')

channel.default_exchange.publish('Hello World!', routing_key: queue.name)

# close connection

connection.close