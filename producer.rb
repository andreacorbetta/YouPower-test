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

# retrieve message from command line, default message is 'Hello World!'

puts 'Write a message to the consumer'

message = ARGV.empty? ? 'Hello World!' : ARGV.join(' ')

queue.publish(message, persistent: true)

puts " [x] Sent #{message}"

# close connection

connection.close