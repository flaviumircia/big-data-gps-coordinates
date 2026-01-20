CREATE TABLE IF NOT EXISTS taxi_stream (
    id BIGSERIAL PRIMARY KEY,
    trip_id TEXT NOT NULL,
    timestamp TIMESTAMP NOT NULL,
    lat DOUBLE PRECISION NOT NULL,
    lon DOUBLE PRECISION NOT NULL
);


CREATE TABLE taxi_routes (
    route_id SERIAL PRIMARY KEY,
    trip_id VARCHAR,         
    start_lat DOUBLE PRECISION,
    start_lon DOUBLE PRECISION,
    end_lat DOUBLE PRECISION,
    end_lon DOUBLE PRECISION,
    path JSONB,
    distance_m DOUBLE PRECISION,
    created_at TIMESTAMP DEFAULT NOW()
);