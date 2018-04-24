using System;
using System.Collections.Generic;
using System.Text;

namespace Conduit.WebUI.Models.Messages
{
    public enum ErrorMessageCode
    {
        CriticalError = 1,
        UsernameAlreadyExists = 101,
        EmailAlreadyExists = 102,
        UsernameOrPassWrong = 103,
        UserAlreadyActive = 104,
        UserNotFound = 105,
        ArticleNotFound = 106,
        ArticleFavoriteAlreadyExists = 107,
        ArticleFavoriteCouldNotInserted = 108,
        UserCouldNotInserted = 109,
        UserCouldNotUpdated = 110,
        UserCouldNotDeleted = 111,
        UserCouldNotFollewedHimself = 112,
        UserCouldNotFollowed = 113,
        ArticleCouldNotDeleted = 114,
        ArticleSlugAlreadyExists = 115,
        ArticleCouldNotInserted = 116,
        ArticleCouldNotUpdated = 117,
        ArticleTagCouldNotInserted = 118,
        TagNotFound = 119,
        ArticleTagAlreadyExists = 120,
        TagAlreadyExists = 121,
        TagCouldNotInserted = 122,
        TagCouldNotDeleted = 123,
        CommentCouldNotInserted = 124,
        CommentCouldNotUpdated = 125,
        CommentNotFound = 126,
        CommentCouldNotDeleted = 127,
        ArticleFavoriteCouldNotDeleted = 128,
    }
}
