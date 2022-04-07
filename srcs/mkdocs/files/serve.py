from starlette.applications import Starlette
from starlette.routing import Mount
from starlette.staticfiles import StaticFiles


routes = [
    Mount('/links', app=StaticFiles(directory='/srv/links/site', html=True), name="static"),
]

app = Starlette(routes=routes)
