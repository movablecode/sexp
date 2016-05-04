--
--  topic.moon
--
--    topic class
--  
--  author: Sangmin Lee
--
--

l_ticket = 0

class Topic
  topics: {}
  new: (name) =>
    @name = name
    @children = {}        --  children topics
    @consumers = {}       --  consumers (a.k.a subscribers)
    @parents = {}
    @ticket = 0
  register: =>
    @@topics[@name] = self
    --  set parent

  getName: => @name
  setParent: (mom) =>
    @parents[mom\getName!] = mom
    mom\adopt self
  adopt: (child)=>
    @children[child\getName!] = child
  separate: (child)=>
    if child
      @children[child\getName!] = nil
    else
      for k,v in pairs(@parents)
        v\separate self
      @parents = {}
  addConsumer: (consumer)=>
    @consumer[consumer\getName] = consumer
  deleteConsumer: (consumer)=>
    @consumer[consumer\getName] = nil
  publish: (m,ticket=0)=>
    for k,v in pairs(@consumers)
      v\consume m
  publishUp: (m,ticket=0)=>
    if ticket==0
      l_ticket += 1
      ticket = l_ticket
    if @ticket==ticket
      return false
    else
      @ticket = ticket
    publish m
    for k,v in pairs(@parents)
      v\publishUp m.ticket
    return true
  publishDown: (m)=>
    if ticket==0
      l_ticket += 1
      ticket = l_ticket
    if @ticket==ticket
      return false
    else
      @ticket = ticket
    publish m
    for k,v in pairs(@children)
      v\publishDown m.ticket
    return true

  --  static: Find Topic
  find: (name)=> @@topics[name]

  --  static: Find Or Create Topic
  foc: (name)=>
    topic = @@topics[name]
    if topic==nil
      topic = Topic name
      topic\register!
    return topic

  --  static: Subscribe
  subscribe: (name,consumer)=>
    topic = foc name
    topic\addConsumer consumer
    return topic

  --  static: Cancel Subscription
  cancel: (name,consumer)=>
    topic = find name
    if topic
      topic\deleteConsumer consumer
    return topic


class Consumer
  consumers = {}
  new: =>
    @subscriptions = {}   --  subscriptions (== topic object)
    @consume = (m)=>
      print "consume "..m
  getName: => @name
  subscribe: (name)=>
    topic = Topic\subscribe name,self
    @subscriptions[name] = topic
  cancel: (name)=>
    topic = Topic\cancel name,self
    @subscriptions[name] = nil


return {
  :Topic
  :Consumer
}
