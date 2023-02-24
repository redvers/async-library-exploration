use "simplelib"

actor Main is NotifierInterface
  let env: Env
  new create(env': Env) =>
    env = env'

    let sl: SimpleLib = SimpleLib(this)
    sl.use_notifier_interface(42, 5)

  be results(a: Array[ISize] val) =>
    env.out.write("Notifier Method: ")
    env.out.print(", ".join(a.values()))



