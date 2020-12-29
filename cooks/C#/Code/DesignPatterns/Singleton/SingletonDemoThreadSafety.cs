namespace DesignPatterns.Singleton
{
    public class SingletonDemoThreadSafety
    {
    private static readonly object padlock = new object();  
    private static  SingletonDemoThreadSafety _instance = null;  
    public static  SingletonDemoThreadSafety Instance  
    {  
        get  
        {  
            lock (padlock)  
            {  
                if (_instance == null)  
                {  
                    _instance = new  SingletonDemoThreadSafety();  
                }  
                return _instance;  
            }  
        }  
    } 
    }
}