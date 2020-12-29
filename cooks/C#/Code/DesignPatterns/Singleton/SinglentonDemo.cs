using System.ComponentModel;
using System.Reflection.Emit;
namespace DesignPatterns.Singleton{
    public class SingletonDemo {

        private static SingletonDemo _instance;
        public static SingletonDemo GetInstance () {

            if (_instance == null) {
                _instance = new SingletonDemo ();
            }
            return _instance;
        }
    }

}