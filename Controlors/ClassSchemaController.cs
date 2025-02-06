using System;
using DB_labb_3.Data;
using DB_labb_3.Interface;
using DB_labb_3.Utils;
using Microsoft.EntityFrameworkCore;

namespace DB_labb_3.Controlors;

public class ClassSchemaController : IController
{
    public void Create()
    {
        throw new NotImplementedException();
    }

    public void Destroy()
    {
        throw new NotImplementedException();
    }

    public void Index()
    {
        throw new NotImplementedException();
    }

    public void Show()
    {
        using var db = new SkolaJosefContext();

        var classes = db.ClassSchemas.Where(c => c.EndDate >= DateTime.Now)
            .Distinct()
            .Include(c => c.Class)
            .Include(c => c.Subject)
            .ToList();


        if (!Validation.ObjNotEmty(classes, $"{TextColor.Red}Inga klasser hittades{TextColor.Normal}"))
        {
            Console.ReadKey();
            return;
        }

        foreach (var c in classes)
        {
            Console.WriteLine($"Klass {TextColor.Cyan}{c.Class.Name}{TextColor.Normal} har {TextColor.Cyan}{c.Subject.Name}{TextColor.Normal} mellan {c.Class.StartDate.ToShortDateString()} och {c.Class.EndDate.ToShortDateString()}");
        }

        Console.ReadKey();
    }

    public void Update()
    {
        throw new NotImplementedException();
    }
}
