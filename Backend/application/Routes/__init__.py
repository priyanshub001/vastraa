from .UserRoutes import user_bp
from .ItemRoutes import Item_bp

def register_routes(app):
    app.register_blueprint(Item_bp)
    app.register_blueprint(user_bp)
    
