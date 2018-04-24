using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;

namespace Conduit.WebApi.Controllers
{
    [Route("api/[controller]")]
    [EnableCors("AllowAll")]
    public class ValuesController : Controller
    {
        // GET api/values
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/values
        [HttpPost]
        public void Post([FromBody]string value)
        {
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }

        [HttpGet("token")]
        [Authorize()]
        public List<string> GetToken()
        {
            List<string> list = new List<string>();
            foreach (var claim in HttpContext.User.Claims)
            {
                list.Add(String.Format("Claim Type: {0}:\nClaim Value:{1}\n", claim.Type, claim.Value));
            }
            return list;
        }

        [HttpGet("token/id")]
        [Authorize()]
        public string GetTokenId()
        {

            return User.FindFirst(System.Security.Claims.ClaimTypes.NameIdentifier).Value;
        }
    }
}
