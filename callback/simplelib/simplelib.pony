use "collections"

actor SimpleLib
  """
  Stupid Simple Library for me to explore how write async APIs.
  (Intended to simulate something like a DB or LDAP query-type affair)

  In the API call you provide a single ISize number and count.
  It "returns"™ an array of the next <count> integers.
  """
  new create() => None

  be use_callback_interface(i: ISize, count: ISize, cb: {(Array[ISize] val): None} val) =>
    let rv: Array[ISize] trn = recover Array[ISize](i.usize()) end
    for f in Range[ISize](ISize(0),count) do
      rv.push(i + f)
    end
    cb(consume rv)


