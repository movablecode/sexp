--  t01.moon
require "lib.lib0"
require "lib.lib1"
import TSchema,TModel,TPersistenceResty from require 'lib.tmodel'

box.cfg {
  custom_proc_title: "tnt_01",
  listen: 3302,
  work_dir: "/home/smlee/db/t01",
  slab_alloc_arena: 0.1,
}

print TPersistenceResty\getPersistence "memtx"
print TPersistenceResty\getPersistence "memtx"
print TPersistenceResty\getPersistence "sophia"

