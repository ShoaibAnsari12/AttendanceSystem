using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AttendanceSystem.Startup))]
namespace AttendanceSystem
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
