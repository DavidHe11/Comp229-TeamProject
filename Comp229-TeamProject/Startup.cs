using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Comp229_TeamProject.Startup))]
namespace Comp229_TeamProject
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
