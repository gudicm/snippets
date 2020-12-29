using System;

namespace SolidSource.DependencyInversion
{
    public class Suv : IAutomobile
    {
        public void Ignition()
        {
            Console.WriteLine("Suv Ignition()");
        }

        public void Stop()
        {
            Console.WriteLine("Suv Stop()");
        }
    }
}