﻿using System;
using System.Collections.Generic;

#nullable disable

namespace BazaPoklona.Models
{
    public partial class VrstaRobe
    {
        public VrstaRobe()
        {
            Poklons = new HashSet<Poklon>();
            Trgovinas = new HashSet<Trgovina>();
        }

        public int ID { get; set; }
        public string Naziv { get; set; }

        public virtual ICollection<Poklon> Poklons { get; set; } // kolekcija (lista) raznih poklona
        public virtual ICollection<Trgovina> Trgovinas { get; set; } // kolekcija raznih trgovina
    }
}
