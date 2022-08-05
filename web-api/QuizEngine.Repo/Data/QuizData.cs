using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using QuizEngine.Core.Models;

namespace QuizEngine.Repo.Data;

public class QuizData : IEntityTypeConfiguration<Quiz>
{
    public void Configure(EntityTypeBuilder<Quiz> builder)
    {
        builder.HasData(
            new Quiz
            {
                Id = 1,
                Title = "Programming Evaluation",
                IsPubslished = true,
                PublishedDate = DateTime.Now,
                PubslishedId = new Guid().ToString().Replace("-", "").Substring(0, 6)
            },

            new Quiz
            {
                Id = 2,
                Title = "Communication Skills"
            });
    }
}
