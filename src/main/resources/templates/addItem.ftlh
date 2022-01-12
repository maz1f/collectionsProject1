<#import "macroses/common.ftlh" as c>
<#include "macroses/security.ftlh">
<@c.page>
        <form method="post">
            <div class="row g-3 mb-5 mt-2">
                <div class="col-md">
                    <div class="form-floating">
                        <input type="text" class="form-control" name = "name" id="putName" />
                        <label for="putName">Item name</label>
                    </div>
                </div>
                <div class="col-md">
                    <div class="form-floating">
                        <input type="text" class="form-control" name ="tag" id="putTag" />
                        <label for="putTag">Item tag</label>
                    </div>
                </div>
                <div class="col-md">
                    <div class="form-floating">
                        <button type="submit" class="btn btn-primary w-25 p-3">Add</button>
                    </div>
                </div>
            </div>

            <input type="hidden" name="_csrf" value="${_csrf.token}" />
        </form>

</@c.page>