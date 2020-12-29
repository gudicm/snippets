namespace SolidSource.DependencyInversion
{

public class DiTask
{
    public static void Run() {
            IAutomobile jeep = new Jepp();
            // IAutomobile suv = new Suv();

            AutomobileController controller = new(jeep);
            controller.Ignition();
            controller.Stop();
        }
}
}