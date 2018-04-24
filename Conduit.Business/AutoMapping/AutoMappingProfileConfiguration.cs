using AutoMapper;
using Conduit.Business.ViewModels;
using Conduit.Common.Dto;
using Conduit.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Conduit.Business.AutoMapping
{
    public class AutoMappingProfileConfiguration : Profile
    {
        public AutoMappingProfileConfiguration() : this("MyProfile")
        {

        }

        protected AutoMappingProfileConfiguration(string profileName) : base(profileName)
        {
            CreateMap<UserDto, User>().ReverseMap();
            CreateMap<CommentDto, Comment>().ReverseMap();
            CreateMap<ArticleViewModel, Article>().ReverseMap()
                .ForMember(dest => dest.Tags, opt => opt.MapFrom(src => src.ArticleTags.Select(p => p.TagId).ToList()))
                .ForMember(p => p.LikedUserIds, opt => opt.MapFrom(src => src.ArticleFavorites.Select(p => p.UserId).ToList()));
            CreateMap<TagViewModel, Tag>().ReverseMap().ForMember(dest => dest.Tag, opt => opt.MapFrom(src => src.TagId));
        }
    }
}
