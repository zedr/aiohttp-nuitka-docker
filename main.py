from datetime import datetime

from aiohttp import web


async def hello(request):
    timestamp = datetime.now().isoformat()
    return web.Response(text=f"Received: {timestamp}")


def main():
    web_app = web.Application()
    web_app.router.add_get("/", hello)
    web.run_app(web_app)


if __name__ == "__main__":
    main()