use "collections"

actor SimpleLib
  """
  Stupid Simple Library for me to explore how write async APIs.
  (Intended to simulate something like a DB or LDAP query-type affair)

  In the API call you provide a single ISize number and count.
  It "returns"™ an array of the next <count> integers.
  """
  let notify: NotifierInterface tag

  new create(notify': NotifierInterface tag) => None
    notify = notify'

  be use_notifier_interface(i: ISize, count: ISize) =>
    let rv: Array[ISize] trn = recover Array[ISize](i.usize()) end
    for f in Range[ISize](ISize(0),count) do
      rv.push(i + f)
    end
    notify.results(consume rv)


interface NotifierInterface
  be results(a: Array[ISize] val) => None
