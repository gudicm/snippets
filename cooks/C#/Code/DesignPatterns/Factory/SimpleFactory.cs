namespace DesignPatterns.Factory {

    public interface IShape {
        public void Draw ();
    }

    public class Circle : IShape {
        public void Draw () {
            throw new System.NotImplementedException ();
        }
    }

    public class Square : IShape {
        public void Draw () {
            throw new System.NotImplementedException ();
        }
    }

    public class Rectangle : IShape {
        public void Draw () {
            throw new System.NotImplementedException ();
        }
    }

    public class FactoryShape {
        public static IShape GetInstance (string shape) {
            switch (shape)
            {
                case @"rectangle":
                    return new Rectangle();

                case @"circle":
                    return new Circle();

                case @"square":
                    return new Square();
                default:
                    break;
            }

            return new Circle ();
        }
    }

    public class SimpleFactoryDemo {
        public static void Run() {


            IShape circle = FactoryShape.GetInstance("rectangle");
            IShape square = FactoryShape.GetInstance("square");

            
        }
    }

}