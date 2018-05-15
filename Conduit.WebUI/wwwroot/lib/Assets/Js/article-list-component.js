
Vue.component('article-list', {
    props: {
        onlyuser: { required: true, type: Boolean },// Sadece user'a mı ait değilse tage göre arama yapcak
        userid: { required: false },
        tag: { required: false },
        onlyliked: { type: Boolean },
        articleDescription:false
    },
    template: `
    <div>
<div v-if="articles.length==0" class="text-center"><code> Herhangi bir makale bulunamadı. </code></div>
  <div class="form-group" v-if="articles.length>0">
                                        <label for="limitOfLastFeed">Gösterilecek Eleman Sayısı Seçin</label>
                                        <select class="form-control" v-model="articleLimit" v-on:change="GetArticles(0)">
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select>
                                    </div>
  <div class="text-center" v-if="isArticleLoading"> <i class="fa fa-spinner fa-pulse fa-3x"></i><p style="font-weight: 700;">Yükleniyor</p></div>
    <feed-article v-for="a in articles" :key="a.id" :article="a"  :is-description="true" :is-detail="articleDescription" v-if="!isArticleLoading" ></feed-article>
<hr />
<div class="text-sm-right"> <code class="text-light bg-info"> Toplam {{articleTotalCount}} makale bulunmaktadır. </code></div>
     <nav v-if="paginationLength>1">
        <ul class="pagination justify-content-center">
            <li class="page-item" v-bind:class="{ disabled:(articleOffset==0) }"><a class="page-link" href="#" v-on:click="GetArticles((articleOffset-1));"> <i class="fa fa-backward"></i> </a></li>
            <li class="page-item" v-for="i in paginationLength" v-on:click="GetArticles((i-1));" v-bind:class="{active:((i-1)==articleOffset)}"><a class="page-link" href="#">{{i}}</a></li>
            <li class="page-item" v-bind:class="{ disabled:(articleOffset==paginationLength-1) }"><a class="page-link" href="#" v-on:click="GetArticles((articleOffset+1));"> <i class="fa fa-forward"></i> </a></li>
        </ul>
     </nav>
</div>
`,
    data() {
        return {
            articles: [],
            articleLimit: 2,
            articleTotalCount: 0,
            articleOffset: 0,
            isArticleLoading: true,
        }

    },
    methods: {
        GetArticles: function (offset = 0) {
            this.isArticleLoading = true;
            var url = 'http://localhost:58160/api/Article?limit=' + this.articleLimit + '&&offset=' + offset;
            if ((this.userid != "" || this.userid != null) && this.onlyuser) {
                url += "&userid=" + this.userid;
                if (this.onlyliked) {
                    url += "&onlyliked=true";
                }
            }
            else {
                url += "&tag=" + this.tag;
            }

            this.$http.get(url).then(function (response) {
                this.articles = response.data.articles;
                this.articleTotalCount = response.data.totalCount;
                this.articleOffset = offset;
                this.isArticleLoading = false;
            }, function (error) {
                console.log(error.statusText);
            });

        }

    },
    mounted: function () {
        this.GetArticles();
    },
    computed: {
        paginationLength() {
            var sonuc = this.articleTotalCount / this.articleLimit;
            if (sonuc > 1 && sonuc < 2) {
                return 2;
            }
            return Math.round(sonuc);
        },


    }
});

