Istruzioni:

-avviare il nodo di RabbitMQ
-aprire una CLI
-eseguire consumer.rb da riga di comando (questo programma continuerà a runnare finchè non riceve un messaggio dal producer)
-aprire una seconda CLI
-eseguire dalla seconda CLI producer.rb, scrivendo il contenuto del messaggio (in caso di messaggio vuoto verrà inviato 'Hello World!')

Note:

-ho avviato la connessione sulla porta 4369 poichè la porta di default era già occupata (potrebbe essere necessario modificare i parametri di connection in producer.rb e consumer.rb)
-per evitare perdita di messaggi, ho settato i parametri durable delle queue a true, ho reso i messaggi persistent e ho abilitato il manual acknowledgement nel subscribe di consumer.rb
