<div class="container">
<table class="table">
    <thead>
    <tr>
        <th>#</th>
        <th>Product</th>
        <th>name</th>
        <th>category</th>
        <th>description</th>
        <th>status</th>
        <th>price</th>
        <th>approved</th>
        <th>rejected</th>
        <th>time</th>
    </tr>
    </thead>
    {foreach $getItems as $item}
        <tr>
            <td>#{$item.id}</td>
            <td><img src="{$item.image}" width="50"></td>
            <td>{$item.name}</td>
            <td>{$item.category}</td>
            <td>{$item.description}</td>
            {if {$item.status} == 0}
            <td>Pending</td>
                {elseif {$item.status} == 1}
                <td>Approved</td>
            {elseif {$item.status} == 2}
                <td>Rejected</td>
            {/if}
            <td>{$item.price}</td>
            {if {$item.status} == 0}
            <td><a class="btn btn-success" href="panel.php?approve={$item.id}">Approve</a></td>
            <td><a class="btn btn-danger" href="panel.php?reject={$item.id}">Reject</a></td>
            {elseif {$item.status} == 1}
            <td>Already approved</td>
            <td><a class="btn btn-danger" href="panel.php?reject={$item.id}">Reject</a></td>
            {elseif {$item.status} == 2}
            <td><a class="btn btn-success" href="panel.php?approve={$item.id}">Approve</a></td>
            <td>Already rejected</td>
            {/if}
            <td>{$item.time}</td>
        </tr>
        {foreachelse}
        <tr><td colspan="9">No results found</td></tr>
    {/foreach}
</table>
</div>