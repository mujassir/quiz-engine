using System.ComponentModel.DataAnnotations;

namespace QuizEngine.Core.Dtos
{
    public class AnswerDto
    {
        public int Id { get; set; }

        public string? Statement { get; set; }

        public bool? IsCorrect { get; set; }

        public int QuestionId { get; set; }
    }

    public class AnswerCreationDto : AnswerAddUpdateDto
    {
    }

    public class AnswerUpdateDto : AnswerAddUpdateDto
    {
    }

    public abstract class AnswerAddUpdateDto
    {
        [Required(ErrorMessage = "Answer statement is a required field.")]
        public string? Statement { get; set; }

        public bool? IsCorrect { get; set; }

        public int QuestionId { get; set; }
    }
}
