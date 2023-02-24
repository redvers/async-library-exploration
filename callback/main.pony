use "simplelib"

actor Main
  let env: Env
  new create(env': Env) =>
    env = env'

    let sl: SimpleLib = SimpleLib
    sl.use_callback_interface(42, 5, Callbacks~callbacka(env))

primitive Callbacks
  fun callbacka(env: Env, a: Array[ISize] val) =>
    env.out.write("Callback Method: ")
    env.out.print(", ".join(a.values()))



