using System.ComponentModel.DataAnnotations;

namespace QuizEngine.Core.Dtos
{
    public class QuizDto
    {
        public int Id { get; set; }

        public string? Title { get; set; }

        public bool? IsPubslished { get; set; }

        public DateTime? PublishedDate { get; set; }

        public string? PubslishedId { get; set; }

        public string? UserId { get; set; }

        public int? NoOfQuestions { get; set; }
    }

    public class QuizCreationDto : QuizAddUpdateDto
    {

    }

    public class QuizUpdateDto : QuizAddUpdateDto
    {
        public bool? IsPubslished { get; set; }

        public DateTime? PublishedDate { get; set; }

        public string? PubslishedId { get; set; }

    }


    public abstract class QuizAddUpdateDto
    {
        [Required(ErrorMessage = "Quiz's title is a required field.")]
        [MaxLength(250, ErrorMessage = "Maximum length for the title is 250 characters.")]
        public string? Title { get; set; }
        public string? UserId { get; set; }
    }
}
