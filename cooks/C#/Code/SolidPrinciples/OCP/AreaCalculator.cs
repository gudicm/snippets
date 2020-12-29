namespace SolidSource.OCP
{
    public class AreaCalculator
    {
        public static double TotalArea(Shape[] shapes) {
            double area = 0;

            foreach (var shape  in shapes)
            {
                area += shape.Area();
            }
            return area;
        }
    }
}