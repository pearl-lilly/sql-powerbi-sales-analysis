-- If we calculate net revenue (after accounting for returns),
 -- how does the ranking of products or categories change compared to gross revenue?
 SELECT
    Product_Name,
    SUM(Revenue) AS gross_revenue,
    SUM(Units_Returned) AS total_units_returned,
    SUM(Units_Sold) AS total_units_sold,

    -- Calculate the estimated revenue lost due to returns for each product
    SUM(
        CASE
            WHEN Units_Sold > 0 THEN Units_Returned * (Revenue / Units_Sold)
            ELSE 0 
        END
    ) AS estimated_return_revenue_loss,

    -- Calculate Net Revenue
    SUM(Revenue) - SUM(
        CASE
            WHEN Units_Sold > 0 THEN Units_Returned * (Revenue / Units_Sold)
            ELSE 0
        END
    ) AS net_revenue,

    -- Rank based on Gross Revenue
    RANK() OVER (ORDER BY SUM(Revenue) DESC) AS gross_revenue_rank,

    -- Rank based on Net Revenue
    RANK() OVER (ORDER BY (
        SUM(Revenue) - SUM(
            CASE
                WHEN Units_Sold > 0 THEN Units_Returned * (Revenue / Units_Sold)
                ELSE 0
            END
        )
    ) DESC) AS net_revenue_rank
FROM
    sales_data
GROUP BY
    Product_Name
ORDER BY
    gross_revenue_rank;
