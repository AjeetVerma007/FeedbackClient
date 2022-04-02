<div class="row mb-2">
    <div class="col-sm-12">
        <button type="button" class="btn btn-light-blue btn-sm waves-effect waves-light open-query" onclick="loadOpenQueries()">
            <i class="fa fa-folder-open fa-fw"></i>Open Queries
        </button>
        <button type="button" class="btn btn-blue-grey btn-sm waves-effect waves-light closed-query" onclick="loadClosedQueries()">
            <i class="fa fa-folder fa-fw"></i>Closed Queries
        </button>
        <button type="button" class="btn btn-blue-grey btn-sm waves-effect waves-light unassigned-query" onclick="loadUnassignedQueries()">
            <i class="fa fa-exclamation-triangle fa-fw"></i>Unassigned Queries
        </button>
    </div>
</div>
<section>

    <!--Panel-->
    <div class="card w-100 query-panel">
        <h6 class="card-header light-blue white-text">
                            <span class="query-title">
                                <i class="fa fa-folder-open"></i>
                                Open Queries
                            </span>
                            <span class="badge badge-info" id="queries-count" title="Total queries" data-toggle="tooltip"></span>
                            <span class="card-buttons">
                                <button class="btn btn-sm btn-info waves-effect waves-light" id="refresh-button" 
                                    title="Refresh Queries" data-toggle="tooltip" onclick="javascript:loadOpenQueries();">
                                    <i class="fa fa-refresh"></i>
                                </button>
                            </span>
                        </h6>
        <div class="card-body">
            <div class="row">
                <div class="col-sm-12 query-table-loader" style="display:none;">
                    <div class="w-100">
                        <div class="">
                            <div class="card-block">
                                <h4 class="card-title float-left pt-1">
                                                    <span class="content-placeholder" style="width: 160px;">&nbsp;</span>
                                                  </h4>
                                <h4 class="card-title float-right pt-1">
                                                    <span class="content-placeholder" style="width: 268px;">&nbsp;</span>
                                                  </h4>
                                <p class="card-text">
                                    <span class="content-placeholder" style="width:100%;">&nbsp;</span>
                                    <span class="content-placeholder" style="width:100%;">&nbsp;</span>
                                    <span class="content-placeholder" style="width:100%;">&nbsp;</span>
                                </p>
                                <h4 class="card-title float-left pt-1">
                                                    <span class="content-placeholder" style="width: 170px;">&nbsp;</span>
                                                  </h4>
                                <h4 class="card-title pt-3 float-right">
                                                    <span class="content-placeholder" style="width: 175px;position: absolute;left: 40%;bottom: 15%;">&nbsp;</span>
                                                  </h4>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 query-table-container pr-0">
                    <table id="paginationFullNumbers" class="table table-striped table-hover dataTable no-footer" width="100%">
                        <thead>
                            <tr>
                                <th class="th-sm">ID
                                </th>
                                <th class="th-sm">NAME
                                </th>
                                <th class="th-sm">OFFICE
                                </th>
                                <th class="th-sm">MODULE
                                </th>
                                <th class="th-sm">SUB-MODULE
                                </th>
                                <th class="th-sm">ASSIGNED ON
                                </th>
                                <th class="th-sm">Status
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><a href="queryDetail.html">161496</a>
                                </td>
                                <td>BIBHU ROUT</td>
                                <td>BHUBANESWAR BO</td>
                                <td>LOAN MANAGEMENT</td>
                                <td>Payout Manager Maker</td>
                                <td><span class="badge badge-success">23-12-2021 11:42:29</span>
                                </td>
                                <td><span class="badge badge-light">Waiting for Support</span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!--/.Panel-->
</section>

<script type="text/javascript">
        $(document).ready(function() {
          debugger;
        	var data = '${queries}';
        	alert(data);
            data = JSON.parse(data);
            displayRecords(data, false);
           
        });
    </script>