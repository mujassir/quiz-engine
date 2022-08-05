using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QuizEngine.Core.Models
{
    public class Question : ModelBase
    {

        [Required(ErrorMessage = "Questions's statement is a required field.")]
        public string? Statement { get; set; }

        public bool? HasMultipleAnswers { get; set; }

        [ForeignKey(nameof(Quiz))]
        public int QuizId { get; set; }

    }
}
