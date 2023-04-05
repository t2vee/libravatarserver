


@app.get("/")
async def root():
    return {"message": "Hello World"}


@app.get("/avatar/{hash}")
async def say_hello(name: str):
    return {"message": f"Hello {name}"}
