using System.ComponentModel.DataAnnotations;

public class AgroLoan
{
    [Required]
    public string? FullName { get; set; }

    [Required]
    public DateTime? ContractDate { get; set;}

    [Required]
    public int FinancingPeriod { get; set; }

    [Required]
    public decimal CreditAmount { get; set; }

    [Required]
    public decimal Rate { get; set; }

    [Required]
    public string? Schedule { get; set; }
}
