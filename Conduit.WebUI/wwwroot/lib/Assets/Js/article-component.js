

Vue.component('feed-article', {
    props: {
        article: { required: true },
        isDetail: false,
        isDescription: false
    },

    template: `
  <div class="reviews" >

                    <div class="row blockquote review-item">
                        <div class="col-md-3 text-center">
                            <img class="rounded-circle reviewer" :src="profilePicture">
                            <div class="caption">
<a role="button"  :href="'/User/'+article.authorUser.userName" class="btn btn-outline-primary btn-sm border-0"><i class="fa fa-user-circle-o"></i> {{article.authorUser.userName}}</a>
                            </div>
                        </div>
                        <div class="col-md-9">

                        <h4 >{{article.title}}
<button class="btn btn-sm btn-outline-danger pull-right " v-on:click="likeOrUnlike" v-if="!isliked" ><i class="fa fa-heart-o"></i> {{article.likedUserIds.length}}</button>
<button class="btn btn-sm btn-danger pull-right " v-on:click="likeOrUnlike" v-if="isliked" ><i class="fa fa-heart"></i> {{article.likedUserIds.length}}</button>
<a class="btn btn-sm btn-outline-info"  v-if="isme" :href="'/Article/Edit/'+this.article.slug"><i class="fa fa-edit"></i> Düzenle</a>

</h4>
                            <p class="review-text">{{body}}<br> <a :href="'/Article/'+article.slug" v-if="isDescription"> <i class="fa fa-arrow-circle-o-right"></i>  devamı için tıklayın.</a> </p>
                            <p class="review-date text-right"><i class="fa fa-clock-o"></i>  {{formatDate(article.updatedAt)}}</p>
                            <hr />
                            <div class="tags text-right">

                                <button v-for="item in article.tags" type="button" class="btn btn-outline-info btn-sm" v-on:click="GoTag(item)"><i class="fa fa-tag"></i> {{item}}</button>
                            </div>
                        </div>
                    </div>
                </div>
</div>
`, methods: {

        formatDate: function (date) {
            return moment(date, 'YYYY-MM-DD HH:mm').format('DD/MM/YYYY HH:mm');
        },
        GoTag: function (tag) {
            if (this.isDetail) {
                return;
            }
            Home.AddTab(tag);
        },
        likeOrUnlike: function (event) {
            var likeUsers = this.article.likedUserIds;
            var userid = this.currentUser;//TODO: burdan giriş yapan useridsini alıyoruz.

    

            var button = $(event.target);
            if (userid == null || userid == "" || userid == undefined) {
                toastr.error('Beğenmeniz için giriş yapmalısınız.', 'Üye giriş yapmamış !', { "positionClass": "toast-bottom-full-width", "closeButton": true, "progressBar": true });
                return;
            }

            var index = likeUsers.indexOf(userid);
            var article = this.article;

            //Like
            $.get("/User/LikeArticle/" + article.id, function (result) {

                if (result.status) {
                    //like
                    likeUsers.push(index);
                    button.removeClass("btn-outline-danger").addClass("btn-danger").find("i").removeClass("fa-heart-o").addClass("fa-heart");
                }
                else if (result.unlike) {
                    //unlike
                    likeUsers.splice(index, 1);
                    button.removeClass("btn-danger").addClass("btn-outline-danger").find("i").removeClass("fa-heart").addClass("fa-heart-o");
                }
                else {
                    //Tokenın bitmesi gibi fena değişik hata
                    $("#tokenAl").html(result);
                    toastr.error(result.message, 'Makale beğenilemedi', { "positionClass": "toast-bottom-right", "closeButton": true, "progressBar": true });

                }
            });


        }
    },
    computed: {
        currentUser() {
            return $("body").data("userid");
        },
        isliked() {
          
            return this.article.likedUserIds.indexOf(this.currentUser) >=0 ;

        },
        isme() {
            return this.article.authorUserId == this.currentUser;

        },
        profilePicture() {
            return this.article.authorUser.image == null ? "http://standaloneinstaller.com/upload/avatar.png" : this.article.authorUser.image;

        },
        body() {
    
            return this.isDescription ? this.article.description : this.article.body;
        },
       
    },
});
