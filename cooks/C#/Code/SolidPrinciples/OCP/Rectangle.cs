namespace SolidSource.OCP
{
    public class Rectangle : Shape
    {
        public double Height { get; set; }
        public double Width { get; set; }
        public Rectangle()
        {
        }

        public override double Area()
        {
            return Height * Width;
        }
    }
}