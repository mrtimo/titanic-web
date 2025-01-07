# Analyzing the Titanic Dataset with Malloy

This tutorial introduces how to use Malloy to analyze the Titanic dataset. Each section builds on the previous one to demonstrate different features of Malloy, using a DuckDB table sourced from a CSV file.

---

## 1. Select All Records

### Description
In this section, we will use a simple `run` query to fetch all records from the Titanic dataset. This serves as a basic introduction to how Malloy queries a dataset.

```malloy
source: titanic is duckdb.table('https://web.stanford.edu/class/archive/cs/cs109/cs109.1166/stuff/titanic.csv') extend {

}

query: titanic -> {
  run
}
```

---

## 2. Select All Records with a Limit

### Description
This section demonstrates how to limit the number of records returned by adding a `limit` clause to the query. We will limit the output to 10 records.

```malloy
query: titanic -> {
  run
  limit: 10
}
```

---

## 3. Group by a Column

### Description
Here, we will group the data by a specific column to understand the distribution of passengers based on their `Pclass` (passenger class).

```malloy
query: titanic -> {
  group_by: Pclass
}
```

---

## 4. Group By with an Aggregate

### Description
In this section, we add an aggregate to the `group_by` query. We will count the number of passengers (`count()`) in each passenger class (`Pclass`).

```malloy
query: titanic -> {
  group_by: Pclass
  aggregate: {
    passenger_count: count()
  }
}
```

---

## 5. Group By with Two Aggregates

### Description
Finally, we extend the previous query to include two aggregates. In addition to counting passengers, we calculate the average fare (`avg(Fare)`) for each passenger class (`Pclass`).

```malloy
query: titanic -> {
  group_by: Pclass
  aggregate: {
    passenger_count: count(),
    average_fare: avg(Fare)
  }
}
