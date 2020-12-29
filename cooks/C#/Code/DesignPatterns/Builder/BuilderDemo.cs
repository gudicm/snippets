namespace Builder {

    // interface to be implemented by ConcreteBuilder
    public interface IToyBuilder {
        void SetModel ();
        void SetHead ();
        void SetLimbs ();
        void SetBody ();
        void SetLegs ();
        Toy GetToy ();
    }

    // product
    public class Toy {
        public string Model {
            get;
            set;
        }
        public string Head {
            get;
            set;
        }
        public string Limbs {
            get;
            set;
        }
        public string Body {
            get;
            set;
        }
        public string Legs {
            get;
            set;
        }
    }

    // concrete builder
    public class ToyBBuilder : IToyBuilder {
        Toy toy = new Toy ();
        public void SetModel () {
            toy.Model = "TOY B";
        }
        public void SetHead () {
            toy.Head = "1";
        }
        public void SetLimbs () {
            toy.Limbs = "4";
        }
        public void SetBody () {
            toy.Body = "Steel";
        }
        public void SetLegs () {
            toy.Legs = "4";
        }
        public Toy GetToy () {
            return toy;
        }
    }

    // concrete builder

    public class ToyABuilder : IToyBuilder {
        Toy toy = new Toy ();
        public void SetModel () {
            toy.Model = "TOY A";
        }
        public void SetHead () {
            toy.Head = "1";
        }
        public void SetLimbs () {
            toy.Limbs = "4";
        }
        public void SetBody () {
            toy.Body = "Plastic";
        }
        public void SetLegs () {
            toy.Legs = "2";
        }
        public Toy GetToy () {
            return toy;
        }
    }

    // Director
    public class ToyCreator {
        private readonly IToyBuilder _toyBuilder;
        public ToyCreator (IToyBuilder toyBuilder) {
            _toyBuilder = toyBuilder;
        }
        public void CreateToy () {
            _toyBuilder.SetModel ();
            _toyBuilder.SetHead ();
            _toyBuilder.SetLimbs ();
            _toyBuilder.SetBody ();
            _toyBuilder.SetLegs ();
        }
        public Toy GetToy () {
            return _toyBuilder.GetToy ();
        }
    }

}