--  pulser.md

# Pulser

Pulser. Programmable Object and Message Broker.


as Message Router.

1.  Publish-Up, Publish-Down
1.  Publish / Subscribe


by traditional, 'topic' has pub/sub function.
and Pulser also has hierarchical publish-up, publish-down.

for example, there are 3 topics

  topic "abc.def.t1"
  topic "abc.def.t2"
  topic "abc.ghi.t1"


if you subscribe topic "abc.def.t1":
  receive message for "abc.def.t1"
  cannot receive for "abc.def.t2"
  cannot receive for "abc.ghi.t1"

if you subscribe topic "abc.def":
  receive message for "abc.def.t1"
  receive message for "abc.def.t2"
  cannot receive for "abc.ghi.t1"

if you subscribe topic "abc":
  receive message for "abc.def.t1"
  receive message for "abc.def.t2"
  receive message for "abc.ghi.t1"

if you subscribe topic "abc.ghi":
  cannot receive for "abc.def.t1"
  cannot receive for "abc.def.t2"
  receive message for "abc.ghi.t1"

Pulser does not offer wildcard '*' subscription. but there are enough useful publish-up, publish-down message distribution.

publish-up is Pulser's default publishing method.


Pulser's client drivers:

  node-pulser   (nodejs)



as Object Broker.

Yes. it is one of message oriented middleware (mom), but specially offer object pub/sub & serializing functionality.
