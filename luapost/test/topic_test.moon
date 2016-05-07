import Topic,Consumer from require "lib.topic"

(require "busted.runner")!


describe "Test Set Starts...",->
  it "Class Works",->
    assert true
    t1 = Topic "bbs"
    t1\register!
    assert t1
    assert t1.name=="bbs"
    assert Topic\find "bbs"
