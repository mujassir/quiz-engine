using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QuizEngine.Core.Models
{
    public class Answer : ModelBase
    {
        [Required(ErrorMessage = "Answer statement is a required field.")]
        public string? Statement { get; set; }

        public bool? IsCorrect { get; set; }


        [ForeignKey(nameof(Question))]
        public int QuestionId { get; set; }

    }
}
