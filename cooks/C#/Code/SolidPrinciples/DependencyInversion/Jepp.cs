using System;

namespace SolidSource.DependencyInversion {
    public class Jepp : IAutomobile {
        public void Ignition () {
            Console.WriteLine ("Jepp Ignition()");
        }

        public void Stop () {
            Console.WriteLine ("Jepp Stop()");
        }
    }
}