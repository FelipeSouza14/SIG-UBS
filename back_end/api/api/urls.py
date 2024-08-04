from django.contrib import admin
from django.urls import path, include
from rest_framework import routers
from core.views import PacienteViewSet, ProfissionalViewSet, VacinacaoViewSet, ConsultaViewSet, AvisosViewSet

router = routers.DefaultRouter()
# router.register(r'administrador', AdministradorViewSet)
router.register(r'pacientes', PacienteViewSet)
router.register(r'profissionais', ProfissionalViewSet)
router.register(r'vacinacao', VacinacaoViewSet)
router.register(r'consultas', ConsultaViewSet)
router.register(r'avisos', AvisosViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('admin/', admin.site.urls),
    path('api-auth/', include('rest_framework.urls')),
    path('api/', include('core.urls')),
]
