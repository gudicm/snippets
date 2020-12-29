namespace SolidSource.InterfaceSegregation
{
    // endangers the Interface segregation principle  
        
    public interface ITask
    {
        void Create();
        void Assign();

        void WorkOn();
        
    }
}