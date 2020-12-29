namespace SolidSource.DependencyInversion
{
    public class AutomobileController
    {
        private readonly IAutomobile _auto;
        public AutomobileController(IAutomobile automobile)
        {
            _auto = automobile;
        }
        
        public void Ignition() {
            _auto.Ignition();
        }
        
        public void Stop() {
            _auto.Stop();
        }
    }
}